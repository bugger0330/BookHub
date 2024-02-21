package com.library.bookhub.entity;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ClubApplication {
	
	private Integer id;
	private Integer clubId;
	private String userName;
	private Timestamp rdate;
	private Timestamp wdate;

}
