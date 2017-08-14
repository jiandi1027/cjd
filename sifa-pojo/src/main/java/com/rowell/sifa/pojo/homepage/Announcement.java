/*
* Announcement.java
* Copyright(C) 2009-2016 北京盘古世纪科技发展有限公司
* All right Reserved
* 2017-04-17 created
*/
package com.rowell.sifa.pojo.homepage;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.rowell.sifa.pojo.base.DataEntity;

/**
 * 公告
 * **/

@SuppressWarnings("serial")
public class Announcement extends DataEntity<Announcement> implements Serializable {
    private String id;

    /**发布人 */
    private String releasePeople;

    /**所在单位 */
    private String placeTheUnit;

    /**公告主题 */
    private String announcementTopic;

    /**发布日期 */
    @JsonFormat(pattern = "yyyy-MM-dd") 
    private Date releaseDate;

	/**公告内容 */
    private String announcement;

    /**附件1 */
    private String file1;

    /**附件2 */
    private String file2;

    /**附件3 */
    private String file3;

    /**阅读用户 */
    private String readingUser;

    /**未读用户 */
    private String didNotReadUser;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getReleasePeople() {
        return releasePeople;
    }

    public void setReleasePeople(String releasePeople) {
        this.releasePeople = releasePeople == null ? null : releasePeople.trim();
    }

    public String getPlaceTheUnit() {
        return placeTheUnit;
    }

    public void setPlaceTheUnit(String placeTheUnit) {
        this.placeTheUnit = placeTheUnit == null ? null : placeTheUnit.trim();
    }

    public String getAnnouncementTopic() {
        return announcementTopic;
    }

    public void setAnnouncementTopic(String announcementTopic) {
        this.announcementTopic = announcementTopic == null ? null : announcementTopic.trim();
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getAnnouncement() {
        return announcement;
    }

    public void setAnnouncement(String announcement) {
        this.announcement = announcement == null ? null : announcement.trim();
    }

    public String getFile1() {
        return file1;
    }

    public void setFile1(String file1) {
        this.file1 = file1 == null ? null : file1.trim();
    }

    public String getFile2() {
        return file2;
    }

    public void setFile2(String file2) {
        this.file2 = file2 == null ? null : file2.trim();
    }

    public String getFile3() {
        return file3;
    }

    public void setFile3(String file3) {
        this.file3 = file3 == null ? null : file3.trim();
    }

    public String getReadingUser() {
        return readingUser;
    }

    public void setReadingUser(String readingUser) {
        this.readingUser = readingUser == null ? null : readingUser.trim();
    }

    public String getDidNotReadUser() {
        return didNotReadUser;
    }

    public void setDidNotReadUser(String didNotReadUser) {
        this.didNotReadUser = didNotReadUser == null ? null : didNotReadUser.trim();
    }  
    
}