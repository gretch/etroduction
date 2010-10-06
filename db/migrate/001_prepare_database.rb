class PrepareDatabase < ActiveRecord::Migration
  def self.up

    create_table :users do |t|
      t.timestamps
      t.string   :login,            :default => nil, :null => true
      t.string   :crypted_password, :default => nil, :null => true
      t.string   :password_salt,    :default => nil, :null => true
      t.string   :persistence_token,                 :null => false
      t.integer  :login_count,      :default => 0,   :null => false
      t.datetime :last_request_at
      t.datetime :last_login_at
      t.datetime :current_login_at
      t.string   :last_login_ip
      t.string   :current_login_ip
      t.string   :openid_identifier
      t.string   :identifier
      t.string   :name
      t.string   :email
      t.string   :location
      t.text     :expertise
      t.text     :expertise_duration
      t.text     :about
      t.boolean  :admin,            :default => false
      t.integer  :facebook_uid,     :limit => 8
      t.string   :linkedin_link
      t.string   :facebook_link
    end

    add_index :users, :login
    add_index :users, :persistence_token
    add_index :users, :last_request_at
    add_index :users, :openid_identifier
    add_index :users, :facebook_uid

    create_table :sessions do |t|
      t.string :session_id, :null => false
      t.text   :data
      t.timestamps
    end

    add_index :sessions, :session_id
    add_index :sessions, :updated_at

  create_table :opportunities do |t|
    t.text :details
    t.string :job_title
    t.string :location
    t.string :shortname
    t.float :compensation
    t.string :category_name
    t.boolean :published
    t.integer :hits, :default => 0
    t.timestamps
    t.references :user
    t.integer :comments_count, :default => 0
    t.integer :category_id, :default => 0, :null => false
  end

  add_index :opportunities, :job_title
  add_index :opportunities, :location
  add_index :opportunities, :details
  add_index :opportunities, :user_id

  create_table :comments, :force => true do |t|
    t.string :title, :limit => 50, :default => ""
    t.string :comment, :default => ""
    t.timestamps :created_at, :null => false
    t.integer :commentable_id, :default => 0, :null => false
    t.string :commentable_type, :limit => 15,
      :default => "", :null => false
    t.references :user, :default => 0, :null => false
    t.references :opportunity, :default => 0, :null => false
    t.string :author_name
  end

  add_index :comments, :commentable_id
  add_index :comments, :commentable_type

  create_table :categories do |t|
    t.string :title
    t.string :description
    t.string :shortname    
    t.timestamps
  end

  create_table :messages do |t|
    t.string :subject
    t.string :body
    t.string :shortname
    t.timestamps :read_at
    t.integer :opportunity_id, :default => 0, :null => false
    t.integer :recepient_id, :default => 0, :null => false
    t.integer :sender_id, :default => 0, :null => false
    t.timestamps
  end

  create_table :friendships do |t|
    t.integer  :user_id,    :null => false
    t.integer  :friend_id,  :null => false
    t.datetime :created_at 
    t.datetime :updated_at
    t.timestamps
  end
  add_index :friendships, :user_id
  add_index :friendships, :friend_id

    create_table :tags do |t|
      t.column :name, :string
    end
    
    create_table :taggings do |t|
      t.column :tag_id, :integer
      t.column :taggable_id, :integer
      
      # You should make sure that the column created is
      # long enough to store the required class names.
      t.column :taggable_type, :string
      
      t.column :created_at, :datetime
    end
    
    add_index :taggings, :tag_id
    add_index :taggings, [:taggable_id, :taggable_type]
    
  end

  def self.down
    drop_table :users
    drop_table :sessions
    drop_table :opportunities
    drop_table :messages
    drop_table :comments
    drop_table :taggings
    drop_table :tags
  end
end
