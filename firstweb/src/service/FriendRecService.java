package service;

import entity.User;

import java.util.*;

public class FriendRecService {
    private FriendService fs;
    private UserService us;

    public FriendRecService(FriendService fs, UserService us) {
        this.fs = fs;
        this.us = us;
    }

    public List<User> rec(int uid) {
        List<User> rec = new ArrayList<>();

        //获得好友列表
        List<User> myFriends = fs.getFriend(uid);

        //获得好友的好友的集合
        List<User> friendOfFriends = new ArrayList<>();
        for (User myFriend : myFriends) {
            friendOfFriends.addAll(fs.getFriend(myFriend.getId()));
        }

        //统计
        Map<Integer, Integer> map = new TreeMap<Integer, Integer>(new Comparator<Integer>() {
            public int compare(Integer obj1, Integer obj2) {
                // 降序排序
                return obj2.compareTo(obj1);
            }
        });

        for (User friendOfFriend : friendOfFriends) {
            map.merge(friendOfFriend.getId(), 1, (a, b) -> a + b);
        }

        //获取排序结果
        Set<Integer> keySet = map.keySet();
        for (Integer key : keySet) {
            if (!fs.isFriend(uid,key) && key != uid){
                //只有非好友才行
                rec.add(us.getUser(key));
                System.out.println(key + " " + map.get(key));
            }
        }
        return rec;
    }
}
