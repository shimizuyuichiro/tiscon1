package tiscon1.form;

import lombok.Data;
import org.hibernate.validator.constraints.NotEmpty;

import java.io.Serializable;

/**
 * @author kawasima
 */
@Data
public class LoginForm implements Serializable {
    @NotEmpty
    private String account;

    @NotEmpty
    private String password;

}
