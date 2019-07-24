package service;

import dao.impl.ExhibitDaoImpl;
import entity.Exhibit;
import entity.LoveItem;
import entity.User;

import java.util.*;

public class ExhibitRecService {
    private LoveService loveService;
    private ExhibitDaoImpl exhibitDao;

    public ExhibitRecService(LoveService loveService,ExhibitDaoImpl exhibitDao) {
        this.loveService = loveService;
        this.exhibitDao = exhibitDao;
    }

    public List<Exhibit> recByPlace(User user){
        List<LoveItem> loveItems = loveService.getLoves(user); //得到该用户目前的收藏列表
        Map<String, Integer> map = new TreeMap<String, Integer>(); //map的键为展品的地点，值为该地点在收藏列表中出现的次数

        Set<Integer> artIdSet = new HashSet<>(); //存放收藏夹中的艺术品id
        for(LoveItem loveItem : loveItems){
            Exhibit exhibit = exhibitDao.getExhibit(loveItem.getArtid()); //得到exhibit对象
            String place = exhibit.getPlace();
            if(map.containsKey(place))
                map.put(place,map.get(place) + 1);
            else
                map.put(place,0);

            artIdSet.add(loveItem.getArtid());
        }

        //先把entrySet存进一个list
        List<Map.Entry<String,Integer>> list = new ArrayList<Map.Entry<String,Integer>>(map.entrySet());

        //对map的值进行降序排序
        Collections.sort(list,new Comparator<Map.Entry<String,Integer>>() {
            //升序排序
            public int compare(Map.Entry<String, Integer> o1,
                               Map.Entry<String, Integer> o2) {
                return o2.getValue().compareTo(o1.getValue());
            }
        });

        String hottestPlace = list.get(0).getKey();//得到该用户的收藏夹中最热门的地点

        List<Exhibit> result = new ArrayList<>();

        for(int i = 0;i < list.size();i++){
            String place = list.get(i).getKey();
            result = getExhibitsByPlace(place,artIdSet);
            if(result.size() > 0)
                break;
        }

        return result;
    }

    public List<Exhibit> getExhibitsByPlace(String place,Set<Integer> artIdSet){
        List<Exhibit> exhibits = exhibitDao.searchExhibits(new String[]{"","",place});//得到该地点对应的展品列表

        List<Exhibit> result = new ArrayList<>();

        //还要去掉那些已经在收藏夹中的
        for(Exhibit exhibit : exhibits){
            if(artIdSet.contains(exhibit.getId()))
                continue;
            else
                result.add(exhibit);
        }

        return result;
    }
}
