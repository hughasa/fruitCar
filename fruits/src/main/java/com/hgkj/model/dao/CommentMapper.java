package com.hgkj.model.dao;

import com.hgkj.model.entity.Comment;

import java.util.List;

public interface CommentMapper {
    int deletecomment(Comment comment);

    int addcomment(Comment comment);

    List<Comment> allcomment(Comment comment,Integer pageIndex,int pagesize);
}