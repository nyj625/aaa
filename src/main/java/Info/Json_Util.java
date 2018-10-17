package Info;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Json_Util {
	public static ObjectMapper mapper = new ObjectMapper();
	public static String toJsonString(Object o) {
		try {
			return mapper.writeValueAsString(o);
		} catch (JsonProcessingException e) {
			return null;
		}
	}
	
	public static Object jsonToObject(String json,Class c) {
		try {
			return mapper.readValue(json,c);
		} catch (Exception e) {
			return null;
		}
	}
}
