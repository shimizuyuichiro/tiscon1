package tiscon1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tiscon1.exception.SystemException;
import tiscon1.repository.CategoryRepository;

/**
 * @author kawasima
 */
@Controller
public class IndexController {
    private static final String MOVIE_ID = "33";
    private static final String MUSIC_ID = "34";

    @Autowired
    CategoryRepository categoryRepository;

    @RequestMapping("/")
    public String index(Model model) {
        try {
            model.addAttribute("movieRank", categoryRepository.findTop10(MOVIE_ID, null));
            model.addAttribute("musicRank", categoryRepository.findTop10(MUSIC_ID, null));
        } catch (Exception e) {
            System.out.println(e);
            throw new SystemException();
        }
        return "index";
    }

}
