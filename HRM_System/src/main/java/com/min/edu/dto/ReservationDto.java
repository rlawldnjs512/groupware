package com.min.edu.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReservationDto {

	private int reserv_id;
	private String room_id;
	private String emp_id;
	private String rev_date;
	private String slot;

}
