package com.library.bookhub.web.dto.book;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class KakaoDoc {

	private List<KakaoBook> documents;
}
