package item.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;


@Data
@Component
public class Item_askDTO {
	private int seq;
	private int item_seq;
	private String id;
	private String category;
	private String comments;
	private String reply;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern = "yyyy-MM-dd")
	private Date logtime;
}
