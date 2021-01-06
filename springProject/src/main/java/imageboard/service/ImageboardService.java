package imageboard.service;

import java.util.List;

import imageboard.bean.ImageboardDTO;
import imageboard.bean.ImageboardPaging;

public interface ImageboardService {

	public void imageboardWrite(ImageboardDTO imageboardDTO);

	public List<ImageboardDTO> getImageboardList(String pg);

	public void imageboardDelete(String[] check);

	public ImageboardPaging imageboardPaging(String pg);

	public ImageboardDTO getImageboardView(String seq);

	public List<ImageboardDTO> infiniteScroll(String pg);


}
