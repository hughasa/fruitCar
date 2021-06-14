package com.hgkj.model.service;

import com.hgkj.model.entity.Comment;

import java.util.List;

public interface CommentService {
    int deletecommentservice(Comment comment);

    int addcommentservice(Comment comment);

    List<Comment> allcommentservice(Comment comment,Integer pageIndex,int pagesize);
}