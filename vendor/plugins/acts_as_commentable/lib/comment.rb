class Comment < ActiveRecord::Base
  belongs_to :commentable#, :polymorphic => true
  belongs_to :user
  # Helper class method to lookup all comments assigned
  # to all commentable types for a given user.
  def self.find_comments_by_user(user)
    find(:all,
      :conditions => ["user_id = ?", user.id],
      :order => "created_at DESC"
    )
  end
  
  # Helper class method to look up all comments for 
  # commentable class name and commentable id.
  def self.find_comments_for_commentable(commentable_str, commentable_id)
    find(:all,
      :conditions => ["commentable_type = ? and commentable_id = ?", commentable_str, commentable_id],
      :order => "created_at DESC"
    )
  end

  # Helper class method to look up a commentable object
  # given the commentable class name and id 
  def self.find_commentable(commentable_str, commentable_id)
    commentable_str.constantize.find(commentable_id)
  end

  def after_create  
    if commentable.attributes['comments_count']  
      commentable.increment!("comments_count")  
    end  
  end  
      
  def before_destroy  
    if commentable.attributes['comments_count']  
      commentable.class.decrement_counter("comments_count", commentable.id)  
    end  
  end
end
