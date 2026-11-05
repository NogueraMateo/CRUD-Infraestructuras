
from fastapi import APIRouter, Depends
from sqlmodel import Session, select
from .models import User
from .database import get_session


router = APIRouter(tags=["Users"], prefix="/api/users")


@router.get("/")
def list_users(db: Session = Depends(get_session)):

    return db.exec(select(User)).all()

@router.post("/", response_model=User)
def write_user(user: User, db: Session = Depends(get_session)):
    db.add(user)
    db.commit()
    db.refresh(user)
    return user
    

@router.put("/{id}/", response_model=User)
def rewrite_user(id: int, user_data: User, db: Session = Depends(get_session)):
    user = db.get(User,id)

    user.sqlmodel_update(user_data)

    db.add(user)
    db.commit()
    db.refresh(user)
    return user


@router.delete("/{id}/", status_code=204)
def remove_user(id: int, db: Session = Depends(get_session)):
    user = db.get(User, id)

    db.delete(user)
    db.commit()


