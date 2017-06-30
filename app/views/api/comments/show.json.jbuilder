json.extract! @comment, :id, :body, :commenter_id, :commentable_type, :commentable_id
json.username @comment.account.username
json.points @comment.upvotes.count - @comment.downvotes.count
json.comment_ids @comment.child_comments.map { |child_comment| child_comment.id }
if Vote.all.find_by(voter_id: current_user.id, votable_id: @comment.id)
  json.voted true
else
  json.voted false
end
