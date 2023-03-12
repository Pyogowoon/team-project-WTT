package com.prec.fileupload;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.prec.ad.AdAtt;
import com.prec.ad.MadVo;
import com.prec.vDetail.MvDetailVo;
import com.prec.vDetail.VDetailAtt;
import com.prec.video.VideoAtt;

@Service
public class FileUploadController {
	//public AwsS3 awsS3 = AwsS3.getInstance();
	
	public static String posterUploadPath = 
			"C:\\Users\\User\\Desktop\\2022_2N\\fProject\\src\\main\\resources\\static\\poster\\";
	public static String teaserUploadPath =
			"C:\\Users\\User\\Desktop\\2022_2N\\fProject\\src\\main\\resources\\static\\teaser\\";
	public static String videosUploadPath = 
			"C:\\Users\\User\\Desktop\\2022_2N\\fProject\\src\\main\\resources\\static\\videos\\";
	public static String pImgUploadPath = 
			"C:\\Users\\User\\Desktop\\2022_2N\\fProject\\src\\main\\resources\\static\\pImg\\";
	//@Autowired
	//S3FileUploadService s3;
	
	public List<VideoAtt> videoUpload(List<MultipartFile> poster,List<MultipartFile> teaser, int sno){
		//Collection<Part> parts=  req.getParts(); 역할
		List<VideoAtt> attList = new ArrayList<VideoAtt>();
		UUID uuid = UUID.randomUUID();
		try {
			if(poster == null && teaser == null) {
				
			}else {
				for(MultipartFile mfp : poster) {
					if(mfp.getOriginalFilename().isEmpty()) continue;
					if(mfp.getOriginalFilename().equals("")) continue;
					String pOriFile = mfp.getOriginalFilename();
					String pSysFile = String.format("%s-%s", 
							uuid.getLeastSignificantBits(), pOriFile);
					File file = new File(posterUploadPath + pSysFile);
					VideoAtt att = new VideoAtt();
					mfp.transferTo(file);
					att.setpOriFile(pOriFile);
					att.setpSysFile(pSysFile);
					att.setSerial(sno);
					for(MultipartFile mft : teaser) {
						if(mft.getOriginalFilename().isEmpty()) continue;
						if(mft.getOriginalFilename().equals("")) continue;
						String tOriFile = mft.getOriginalFilename();
						String tSysFile = String.format("%s-%s",
								uuid.getLeastSignificantBits(), tOriFile);
						File fileT = new File(teaserUploadPath + tSysFile);
						mft.transferTo(fileT);
					
						att.settOriFile(tOriFile);
						att.settSysFile(tSysFile);
						attList.add(att);
					}
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return attList;
	}
	public List<VideoAtt> posterModify(List<MultipartFile> poster, int sno){
		List<VideoAtt> attList = new ArrayList<VideoAtt>();
		UUID uuid = UUID.randomUUID();
		try {
			if(poster == null) {
				
			}else {
				for(MultipartFile mfp : poster) {
					if(mfp.getOriginalFilename().isEmpty()) continue;
					if(mfp.getOriginalFilename().equals("")) continue;
					String pOriFile = mfp.getOriginalFilename();
					String pSysFile = String.format("%s-%s", 
							uuid.getLeastSignificantBits(), pOriFile);
					File file = new File(posterUploadPath + pSysFile);
					VideoAtt att = new VideoAtt();
					mfp.transferTo(file);
					att.setpOriFile(pOriFile);
					att.setpSysFile(pSysFile);
					att.setSerial(sno);
					attList.add(att);
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return attList;
	}
	public List<VideoAtt> teaserModify(List<MultipartFile> teaser, int sno){
		List<VideoAtt> attList = new ArrayList<VideoAtt>();
		UUID uuid = UUID.randomUUID();
		try {
			if(teaser == null) {
				
			}else {
				for(MultipartFile mft : teaser) {
					if(mft.getOriginalFilename().isEmpty()) continue;
					if(mft.getOriginalFilename().equals("")) continue;
					String tOriFile = mft.getOriginalFilename();
					String tSysFile = String.format("%s-%s",
							uuid.getLeastSignificantBits(), tOriFile);
					File fileT = new File(teaserUploadPath + tSysFile);
					mft.transferTo(fileT);
					VideoAtt att = new VideoAtt();
					
					att.settOriFile(tOriFile);
					att.settSysFile(tSysFile);
					att.setSerial(sno);
					attList.add(att);
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return attList;
	}
	// 영화 상세정보------------------
	public List<VDetailAtt> detailUpload(List<MultipartFile>[] poster, List<MultipartFile>[] vid, Integer[] sno){
		UUID uuid = UUID.randomUUID();
		ArrayList<VDetailAtt> attList= null;
		try {
			if(poster != null && vid != null) {
				VDetailAtt[] attArray = new VDetailAtt[sno.length];
				for(int i=0 ; i<poster.length ; i++) {
					for(MultipartFile mfp : poster[i]) {
						if(mfp.getOriginalFilename().isEmpty()) continue;
						if(mfp.getOriginalFilename().equals("")) continue;
						String dpOriFile = mfp.getOriginalFilename();
						String dpSysFile = String.format("%s-%s", 
								uuid.getLeastSignificantBits(), dpOriFile);
						File file = new File(posterUploadPath + dpSysFile);
						VDetailAtt att = new VDetailAtt();
						mfp.transferTo(file);
						att.setDpOriFile(dpOriFile);
						att.setDpSysFile(dpSysFile);
						attArray[i] = att;
					}
				}
				for(int i=0 ; i<sno.length ; i++) {
					attArray[i].setvSno(sno[i]);
				}
				for(int i= 0 ; i<vid.length ; i++) {
					for(MultipartFile mfv : vid[i]) {
						if(mfv.getOriginalFilename().isEmpty()) continue;
						if(mfv.getOriginalFilename().equals("")) continue;
						String vOriFile = mfv.getOriginalFilename();
						//String vSysFile = s3.upload(mfv);
						String vSysFile = String.format("%s-%s",
								uuid.getLeastSignificantBits(), vOriFile);
						File fileT = new File(videosUploadPath+vSysFile);
						mfv.transferTo(fileT);
						//awsS3.upload(fileT, vSysFile);
						
						attArray[i].setvOriFile(vOriFile);
						attArray[i].setvSysFile(vSysFile);
						
					}
				}
				attList = new ArrayList<VDetailAtt>(Arrays.asList(attArray));
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return attList;
	}
	
	public List<VDetailAtt> detailModify(List<MultipartFile>[] poster, List<MultipartFile>[] vid, List<MvDetailVo> detailModifyList){
		UUID uuid = UUID.randomUUID();
		ArrayList<VDetailAtt> attList= null;
		try {
			if(poster != null && vid != null) {
				VDetailAtt[] attArray = new VDetailAtt[detailModifyList.size()];
				for(int i=0 ; i<detailModifyList.size() ; i++) {
					VDetailAtt att = new VDetailAtt();
					att.setvSno(detailModifyList.get(i).getSno());
					attArray[i] = att;
				}
				for(int i=0 ; i<poster.length ; i++) {
					for(MultipartFile mfp : poster[i]) {
						if(mfp.getOriginalFilename().isEmpty() || mfp.getOriginalFilename().equals("")) {
							attArray[i].setDpOriFile(detailModifyList.get(i).getDpOriFile());
							attArray[i].setDpSysFile(detailModifyList.get(i).getDpSysFile());
						}else {
							String dpOriFile = mfp.getOriginalFilename();
							String dpSysFile = String.format("%s-%s", 
									uuid.getLeastSignificantBits(), dpOriFile);
							File file = new File(posterUploadPath + dpSysFile);
							mfp.transferTo(file);
							attArray[i].setDpOriFile(dpOriFile);
							attArray[i].setDpSysFile(dpSysFile);
						}
					}
				}
				for(int i= 0 ; i<vid.length ; i++) {
					for(MultipartFile mfv : vid[i]) {
						if(mfv.getOriginalFilename().isEmpty() || mfv.getOriginalFilename().equals("")) {
							attArray[i].setvOriFile(detailModifyList.get(i).getvOriFile());
							attArray[i].setvSysFile(detailModifyList.get(i).getvSysFile());
						}else {
							
							
							String vOriFile = mfv.getOriginalFilename();
							//String vSysFile = s3.upload(mfv);
							
							String vSysFile = String.format("%s-%s",
									uuid.getLeastSignificantBits(), vOriFile);
							File fileT = new File(videosUploadPath + vSysFile);
							mfv.transferTo(fileT);
							
							attArray[i].setvOriFile(vOriFile);
							attArray[i].setvSysFile(vSysFile);
						}
					}
				}
				attList = new ArrayList<VDetailAtt>(Arrays.asList(attArray));
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return attList;
	}
	//광고정보---------------------------------
	public List<AdAtt> adUpload(List<MultipartFile>[] sImg, Integer[] aSno){
		UUID uuid = UUID.randomUUID();
		ArrayList<AdAtt> attList= null;
		try {
			if(sImg != null) {
				AdAtt[] attArray = new AdAtt[aSno.length];
				for(int i=0 ; i<aSno.length ; i++) {
					AdAtt att = new AdAtt();
					att.setaSno(aSno[i]);
					attArray[i] = att;
				}
				for(int i=0 ; i<sImg.length ; i++) {
					for(MultipartFile mfp : sImg[i]) {
						if(mfp.getOriginalFilename().isEmpty()) continue;
						if(mfp.getOriginalFilename().equals("")) continue;
						String OriFile = mfp.getOriginalFilename();
						String SysFile = String.format("%s-%s", 
								uuid.getLeastSignificantBits(), OriFile);
						File file = new File(pImgUploadPath + SysFile);
						mfp.transferTo(file);
						attArray[i].setOriFile(OriFile);
						attArray[i].setSysFile(SysFile);
					}
				}
				attList = new ArrayList<AdAtt>(Arrays.asList(attArray));
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return attList;
	}
	
	public List<AdAtt> adModify(List<MultipartFile>[] moImg, List<MadVo> adModifyList){
		UUID uuid = UUID.randomUUID();
		ArrayList<AdAtt> attList= null;
		try {
			if(moImg != null) {
				AdAtt[] attArray = new AdAtt[adModifyList.size()];
				for(int i=0 ; i<adModifyList.size() ; i++) {
					AdAtt att = new AdAtt();
					att.setaSno(adModifyList.get(i).getSno());
					attArray[i] = att;
				}
				for(int i=0 ; i<moImg.length ; i++) {
					for(MultipartFile mfp : moImg[i]) {
						if(mfp.getOriginalFilename().isEmpty() || mfp.getOriginalFilename().equals("")) {
							attArray[i].setOriFile(adModifyList.get(i).getOriFile());
							attArray[i].setSysFile(adModifyList.get(i).getSysFile());
						}else {
							String OriFile = mfp.getOriginalFilename();
							String SysFile = String.format("%s-%s", 
									uuid.getLeastSignificantBits(), OriFile);
							File file = new File(pImgUploadPath + SysFile);
							mfp.transferTo(file);
							attArray[i].setOriFile(OriFile);
							attArray[i].setSysFile(SysFile);
						}
					}
				}
				attList = new ArrayList<AdAtt>(Arrays.asList(attArray));
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return attList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
