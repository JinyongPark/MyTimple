package visang.timple.interfaces;

import java.util.ArrayList;
import java.util.HashMap;

public interface IApply {

	ArrayList<Object> view(String seq);

	void add(HashMap<String, String> map);

	void addok(String acceptanceid);

	void reject(String acceptanceid);

	ArrayList<Object> result(HashMap<String, String> map);

	void invite(HashMap<String, String> map);

	String seq();

	void accept(String pseq);

}
