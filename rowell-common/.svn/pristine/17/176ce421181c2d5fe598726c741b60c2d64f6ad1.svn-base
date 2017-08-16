package com.rowell.common.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@SuppressWarnings("serial")
public class TreeVO implements Serializable{
	private String id;// 节点id
	private String pId;// 父节点pId I必须大写
	private String text;// 节点名称
	private boolean open = false;// 是否展开树节点，默认不展开
	private List<TreeVO> children;

	
	public List<TreeVO> getChildren() {
		return children;
	}

	public void setChildren(List<TreeVO> children) {
		this.children = children;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}


	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}
	//将list转换成节点数
	public static List<TreeVO> getTreeList(List<TreeVO> list){
		//遍历所有节点，如果i的id和j的pId相同，则认为j为i的子节点，并将j的id设置为空（做记号），方便删除
		for(int i=0;i<list.size();i++){
			//子节点集合
			List<TreeVO> children = new ArrayList<TreeVO>();
			for(int j=0;j<list.size();j++){
				if(list.get(i).getId().equals(list.get(j).getpId())){
					children.add(list.get(j));
					list.get(j).setOpen(true);
				}
			}
			list.get(i).setChildren(children);
		}
		//迭代器,删除重复节点
		 Iterator<TreeVO> i = list.iterator();
	     TreeVO temp = null;
	     while (i.hasNext()) {
	        temp = i.next();
	        if (temp.isOpen()) {
	             i.remove();
	          }
	      }
		return list;
	}
	
}
