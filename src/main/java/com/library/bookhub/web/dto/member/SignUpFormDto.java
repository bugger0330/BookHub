package com.library.bookhub.web.dto.member;

import java.time.LocalDateTime;

import org.hibernate.validator.constraints.Range;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


// 회원가입 정보 입력 dto
@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class SignUpFormDto {
	
	@NotBlank(message = "아이디를 입력해 주세요.")
	@Pattern(regexp = "^[a-z]+[a-z0-9]{4,12}$", 
		message="영문, 숫자로 4~12자리까지 설정해 주세요.")
	@Size(min = 4, max =12, message = "아이디는 최소 4자 최대 12자 까지 작성 가능합니다.")
	private String uid;
	
	@NotBlank(message = "비밀번호를 입력해 주세요.")
    @Pattern(regexp = "^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\\\(\\\\)\\-_=+]).{8,12}$", 
    	message="비밀 번호는 영어,숫자,특수 문자를 포함한 8~12자리로 작성해 주세요.")
	@Size(min = 8, max =12, message = "비밀번호는 최소 8자 최대 12자까지 작성 가능합니다.")
	private String password;
	
	@NotBlank(message = "이름을 입력해 주세요.")
    @Pattern(regexp = "^[가-힣]*$", 
    	message="이름은 한글로 입력해 주세요.")
    @Size(min = 2, max =20, message = "이름은 2자 이상 작성해야 합니다.")
	private String name;
	
	@NotNull
	@Range(min = 1, max =2, message = "성별이 제대로 선택되지 않았습니다.")
	private int gender;
	
	@NotBlank(message = "전화 번호를 입력해 주세요.")
    @Pattern(regexp = "^01(?:0|1|[6-9])-(?:\\d{4})-\\d{4}$", 
    	message="하이픈(-)을 포함하여 휴대전화번호를 정확하게 입력해주세요.")
	private String hp; // phone
	
	
	@NotBlank(message = "이메일을 입력해주세요.")
	@Pattern(regexp = "^[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$", 
		message="이메일 주소를 정확하게 입력해주세요.")
	private String email;
	
	private String role;
	
	private String zip;
	
	private String addr1;
	
	private String addr2;
	
	private LocalDateTime rdate;
	
}
