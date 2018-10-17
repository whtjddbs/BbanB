package item.bean;


import org.springframework.stereotype.Component;
import lombok.Data;

@Component
@Data
public class Item_detailDTO {
	private int seq;
	private String main_codename;
	private String sub_codename;
	private String info;
}
