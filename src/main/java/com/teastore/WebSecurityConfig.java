/*
 * package com.teastore;
 * 
 * import org.springframework.context.annotation.Bean; import
 * org.springframework.context.annotation.Configuration; import
 * org.springframework.security.config.annotation.web.builders.HttpSecurity;
 * import org.springframework.security.config.annotation.web.configuration.
 * EnableWebSecurity; import
 * org.springframework.security.config.annotation.web.configuration.
 * WebSecurityConfigurerAdapter; import
 * org.springframework.security.core.userdetails.User; import
 * org.springframework.security.core.userdetails.UserDetailsService; import
 * org.springframework.security.provisioning.InMemoryUserDetailsManager;
 * 
 * @Configuration
 * 
 * @SuppressWarnings("deprecation")
 * 
 * @EnableWebSecurity public class WebSecurityConfig extends
 * WebSecurityConfigurerAdapter {
 * 
 * @Bean
 * 
 * @Override public UserDetailsService userDetailsService() { // Tạo ra user
 * trong bộ nhớ // lưu ý, chỉ sử dụng cách này để minh họa // Còn thực tế chúng
 * ta sẽ kiểm tra user trong csdl InMemoryUserDetailsManager manager = new
 * InMemoryUserDetailsManager(); manager.createUser(
 * User.withDefaultPasswordEncoder() // Sử dụng mã hóa password đơn giản
 * .username("admin") .password("DnK1307@!") .roles("ADMIN") // phân quyền là
 * người dùng. .build() ); return manager; }
 * 
 * @Override protected void configure(HttpSecurity http) throws Exception { http
 * .authorizeRequests() .antMatchers("/", "/home/index").permitAll() // Cho phép
 * tất cả mọi người truy cập vào 2 địa chỉ này
 * .antMatchers("/admin/**").authenticated() // Tất cả các request khác đều cần
 * phải xác thực mới được truy cập .and() .formLogin() // Cho phép người dùng
 * xác thực bằng form login .defaultSuccessUrl("/admin/home/index") .permitAll()
 * // Tất cả đều được truy cập vào địa chỉ này .and() .logout() // Cho phép
 * logout .permitAll(); } }
 */