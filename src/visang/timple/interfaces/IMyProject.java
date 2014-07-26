/**
 * 
 */
package visang.timple.interfaces;

import java.util.List;

import visang.timple.model.MyProjectDTO;

/**
 * @author YJH
 *
 */
public interface IMyProject {
	public List<MyProjectDTO> myprojectList(int memberId);
}
