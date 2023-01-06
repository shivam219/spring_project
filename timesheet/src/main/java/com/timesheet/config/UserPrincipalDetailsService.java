package com.timesheet.config;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.timesheet.model.User;
import com.timesheet.repository.UserRepository;

@Service
public class UserPrincipalDetailsService implements UserDetailsService {
	private UserRepository userRepository;

	public UserPrincipalDetailsService(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	@Override
	public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
		User user = this.userRepository.findByEmpId(s);
		System.out.println(user);
		UserPrincipal userPrincipal = new UserPrincipal(user);

		return userPrincipal;
	}
}
