package Com.Sravan.Service;

import Com.Sravan.DTO.RegistrationDTO;

public interface RegistrationService {

    public void saveMainUser(RegistrationDTO regDTO);

    public void saveUserDetails(RegistrationDTO regDTO);
}
