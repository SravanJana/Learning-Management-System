package Com.Sravan.Controller;

import Com.Sravan.DTO.RegistrationDTO;
import Com.Sravan.Service.RegistrationService;
import jakarta.validation.Valid;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.ArrayList;

@Controller
public class RegistrationController {

    @Autowired
    public RegistrationService registrationService;



    @GetMapping(value = "register")
    public String register(@ModelAttribute("regDTO") RegistrationDTO regDTO) {
        return "registerPage";
    }

    @PostMapping(value = "/processRegistration")
    public String processRegistrationPage(@Valid @ModelAttribute("regDTO") RegistrationDTO regDTO, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("regDTO", regDTO);
            return "registerPage";
        }
        registrationService.saveMainUser(regDTO);
        registrationService.saveUserDetails(regDTO);


        return "redirect:/customLogin";
    }
}
