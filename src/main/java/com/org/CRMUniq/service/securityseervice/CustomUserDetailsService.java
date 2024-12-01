package com.org.CRMUniq.service.securityseervice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.org.CRMUniq.Repo.AllUsersRepo;
import com.org.CRMUniq.model.AllUsers;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	AllUsersRepo allUsersRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		AllUsers allUsers = allUsersRepository.findByuname(username);

		if (allUsers == null) {
			throw new UsernameNotFoundException("User not found with username: " + username);
		}
		
		return User.builder().username(allUsers.getUname()) .password(allUsers.getPwd()).roles(allUsers.getRole()).build();
	}

}
