package tiscon1.repository.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import tiscon1.exception.SystemException;
import tiscon1.model.Item;
import tiscon1.model.Movie;
import tiscon1.model.Music;
import tiscon1.repository.CategoryRepository;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author fujiwara
 */
@Component
public class CategoryRepositoryImpl implements CategoryRepository {
    /**
     * 検索用APIアドレス
     */
    public static final String MOVIE_ID = "33";
    public static final String MUSIC_ID = "34";
    static final String SEARCH_URL = "https://itunes.apple.com/jp/rss/top{genreName}/limit=10/genre={subgenreId}/json";
    static final String LOOKUP_ID_URL = "https://itunes.apple.com/lookup?country=JP&id={id}";

    /**
     * プロキシ設定を必要とする場合のRestTemplate生成メソッド。
     *
     * @param host   ホスト名
     * @param portNo ポート番号
     * @return プロキシが設定されたrestTemplate
     */
    private RestTemplate myRest(String host, int portNo) {
        SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
        factory.setProxy(new Proxy(Proxy.Type.HTTP, new InetSocketAddress(host, portNo)));

        return new RestTemplate(factory);
    }

    private String getGenreName(String genreId) {
        if (genreId == null) {
            throw new IllegalArgumentException("geneId is null");
        } else switch (genreId) {
            case MOVIE_ID: return "movies";
            case MUSIC_ID: return "songs";
            default: throw new IllegalArgumentException("Unknown genre: " + genreId);
        }
    }

    @Override
    public List<Item> findTop10(String genreId, String subgenreId) throws IOException {
        // プロキシ設定が不要の場合
        RestTemplate rest = new RestTemplate();
        // プロキシ設定が必要の場合
        // RestTemplate rest = myRest("proxy.co.jp", 8080);

        String jsonString = rest.getForObject(SEARCH_URL, String.class, getGenreName(genreId), subgenreId);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> top10Map = (Map<String, Object>) mapper.readValue(jsonString, Map.class).get("feed");
        List<Map<String, Object>> top10List = (List<Map<String, Object>>) top10Map.get("entry");

        List<Item> top10 = new ArrayList<Item>();

        for (Map<String, Object> map : top10List) {
            if (genreId.equals(MOVIE_ID)) {
                Movie movie = new Movie();
                Map<String, Map<String, Object>> mapId = (Map<String, Map<String, Object>>) map.get("id");
                Map<String, Object> mapTitle = (Map<String, Object>) map.get("im:name");
                List<Map<String, Object>> mapImage = (List<Map<String, Object>>) map.get("im:image");
                Map<String, Object> mapSummary = (Map<String, Object>) map.get("summary");
                Map<String, Object> mapPrice = (Map<String, Object>) map.get("im:price");
                Map<String, Map<String, Object>> mapGenre = (Map<String, Map<String, Object>>) map.get("category");
                Map<String, Map<String, Object>> mapReleaseDate = (Map<String, Map<String, Object>>) map.get("im:releaseDate");
                //データ追加
                movie.setId((String) mapId.get("attributes").get("im:id"));
                movie.setTitle((String) mapTitle.get("label"));
                String Image = (String) mapImage.get(1).get("label");
                Image = Image.replaceAll("60x60bb-85", "400x400bb");
                movie.setImage((String) Image);
                movie.setSummary((String) mapSummary.get("label"));

                String price = (String) mapPrice.get("label");
                price = price.replaceAll("¥", "");
                movie.setPrice(price);
                movie.setGenre((String) mapGenre.get("attributes").get("label"));
                movie.setReleaseDate((String) mapReleaseDate.get("attributes").get("label"));
                top10.add(movie);
                //top10.add(searchItem(genreId, (String) mapId.get("attributes").get("im:id")));
            } else if (genreId.equals(MUSIC_ID)) {
                Music music = new Music();
                Map<String, Map<String, Object>> mapId = (Map<String, Map<String, Object>>) map.get("id");
                Map<String, Object> mapTitle = (Map<String, Object>) map.get("im:name");
                List<Map<String, Object>> mapImage = (List<Map<String, Object>>) map.get("im:image");
                Map<String,Object>mapArtist=(Map<String,Object>)map.get("im:artist");
                Map<String,Map<String,Object>>mapAlbum=(Map<String,Map<String,Object>>)map.get("im:collection");
                Map<String, Object> mapPrice = (Map<String, Object>) map.get("im:price");
                Map<String, Map<String, Object>> mapGenre = (Map<String, Map<String, Object>>) map.get("category");
                Map<String, Map<String, Object>> mapReleaseDate = (Map<String, Map<String, Object>>) map.get("im:releaseDate");

                music.setId((String) mapId.get("attributes").get("im:id"));
                music.setTitle((String) mapTitle.get("label"));
                String Image = (String) mapImage.get(1).get("label");
                Image = Image.replaceAll("60x60bb-85", "400x400bb");
                music.setImage((String) Image);
                String price = (String) mapPrice.get("label");
                price = price.replaceAll("¥", "");
                music.setPrice(price);
                music.setGenre((String) mapGenre.get("attributes").get("label"));
                music.setReleaseDate((String) mapReleaseDate.get("attributes").get("label"));
                music.setArtist((String) mapArtist.get("label"));
                music.setAlbum((String)mapAlbum.get("im:name").get("label"));
                top10.add(music);
            } else {
                throw new SystemException();
            }
        }
            return top10;
    }

    public Item searchItem(String genreId, String id) throws IOException {
        // プロキシ設定が不要の場合
        RestTemplate rest = new RestTemplate();
        // プロキシ設定が必要の場合
        // RestTemplate rest = myRest("proxy.co.jp", 8080);

        String jsonString = rest.getForObject(LOOKUP_ID_URL, String.class, id);
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> mapItem = (Map<String, Object>) ((List<Object>) mapper.readValue(jsonString, Map.class).get("results")).get(0);

        // 参照する画像ファイルの大きさを変更
        String imageUrl = (String) mapItem.get("artworkUrl100");
        imageUrl = imageUrl.replaceAll("100x100bb.jpg", "400x400bb.jpg");

        if (genreId.equals(MOVIE_ID)) {
            Movie movie = new Movie();
            movie.setId(id);
            movie.setTitle((String) mapItem.get("trackName"));
            movie.setImage(imageUrl);
            movie.setSummary((String) mapItem.get("longDescription"));
            Double price = (Double) mapItem.get("collectionPrice");
            movie.setPrice(String.valueOf(price.intValue()));
            movie.setGenre((String) mapItem.get("primaryGenreName"));
            movie.setReleaseDate((String) mapItem.get("releaseDate"));
            return movie;
        } else if (genreId.equals(MUSIC_ID)) {
            Music music = new Music();
            music.setId(id);
            music.setTitle((String) mapItem.get("trackName"));
            music.setImage(imageUrl);
            music.setArtist((String) mapItem.get("artistName"));
            Double price = (Double) mapItem.get("trackPrice");
            music.setPrice(String.valueOf(price.intValue()));
            music.setGenre((String) mapItem.get("primaryGenreName"));
            music.setReleaseDate((String) mapItem.get("releaseDate"));
            return music;
        } else {
            throw new SystemException();
        }
    }
}
