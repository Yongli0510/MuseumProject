package service;

import dao.impl.InviteDaoImpl;
import entity.Invite;

import java.util.List;

public class InviteService {
    InviteDaoImpl idi;
    FriendService fs;

    public InviteService(InviteDaoImpl idi) {
        this.idi = idi;
    }

    public InviteService(InviteDaoImpl idi, FriendService fs) {
        this.idi = idi;
        this.fs = fs;
    }

    public void agree(int sendId, int resId){
        //将agree值设为1
        idi.updateAgree(sendId,resId,1);

        //添加好友表
        fs.addFriend(sendId,resId);
    }

    public void refuse(int sendId, int resId){
        //将agree值设为2
        idi.updateAgree(sendId,resId,2);
    }

    public void addNewInvitation(int sendId, int resId){
        idi.addNewInvitation(sendId,resId);
    }


    public List<Invite> getInvite(int resId){
        return idi.getInvites(resId);
    }
}

