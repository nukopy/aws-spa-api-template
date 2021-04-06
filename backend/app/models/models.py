from sqlalchemy import Column, ForeignKey, Integer, String
from sqlalchemy.orm import relationship

from ..database import Base


class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    hashed_password = Column(String)

    # relationship
    profile = relationship("UserProfile", backref="user")
    articles = relationship("Article", backref="user")


class UserProfile(Base):
    __tablename__ = "user_profiles"

    id = Column(Integer, primary_key=True, index=True)
    email = Column(String, unique=True, index=True)
    description = Column(String)

    # foreign key
    user_id = Column(Integer, ForeignKey("users.id"))


class Article(Base):
    __tablename__ = "articles"

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String, index=True)
    text = Column(String, index=True)

    # foreign key
    owner_id = Column(Integer, ForeignKey("users.id"))
