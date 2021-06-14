package com.hgkj.model.service.impl;

import com.hgkj.model.dao.CommentMapper;
import com.hgkj.model.entity.Comment;
import com.hgkj.model.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CommentServiceimpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public int deletecommentservice(Comment comment) {
        return commentMapper.deletecomment(comment);
    }

    @Override
    public int addcommentservice(Comment comment) {
        return commentMapper.addcomment(comment);
    }

    @Override
    public List<Comment> allcommentservice(Comment comment,Integer pageIndex,int pagesize) {
        return commentMapper.allcomment(comment,pageIndex,pagesize);
    }

    public void setCommentMapper(CommentMapper commentMapper) {
        this.commentMapper = commentMapper;
    }
}