package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.Role;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.RoleRepository;
import vn.hoidanit.laptopshop.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public List getAllUsers() {
        List<User> arrayAllUser = this.userRepository.findAll();
        return arrayAllUser;
    }

    public List getAllUsersByEmail(String email) {
        return this.userRepository.findByEmail(email);

    }

    public User getDetailUserbyId(long id) {
        return this.userRepository.findById(id);

    }

    public User handleSaveUser(User user) {
        User user2 = this.userRepository.save(user);
        return user2;
    }

    public void deleteUser(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

}
