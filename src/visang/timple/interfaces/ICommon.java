package visang.timple.interfaces;

import java.util.ArrayList;
import java.util.Map;

public interface ICommon {

	public int insert(String id, Object value);
	
	public int update(String id, Object value);
	public int update(String id, Map<String, Object> map);
	
	public int delete(String id, Object value);
	public int delete(String id, Map<String, Object> map);
	public int deleteAll(String id);
	
	public int getIntValue(String id);
	public int getIntValue(String id, Object value);
	public int getIntValue(String id, Map<String, Object> map);
	
	public ArrayList<Object> selectList(String id);
	public ArrayList<Object> selectList(String id, Object value);
	public ArrayList<Object> selectList(String id, Map<String, Object> map);
	
	public Object selectOne(String id);
	public Object selectOne(String id, Object value);
	public Object selectOne(String id, Map<String, Object> map);
}
