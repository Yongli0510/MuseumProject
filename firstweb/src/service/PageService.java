package service;

import dao.impl.ExhibitDaoImpl;
import entity.Exhibit;
import entity.Page;

import java.util.List;

public class PageService {
    private ExhibitDaoImpl exhibitDao;

    public PageService(ExhibitDaoImpl e) {
        this.exhibitDao = e;
    }

    public Page<Exhibit> paging(String[] searchItems, int currentPage) {
        List<Exhibit> resultSet = exhibitDao.searchExhibits(searchItems);
        Page<Exhibit> bean = new Page<>();
        bean.setPageSize(6);//每页展示6条数据
        bean.setCurrentPage(currentPage);

        int totalNum = resultSet.size();//获取总的记录数
        bean.setTotalNum(totalNum);

        if (totalNum % bean.getPageSize() == 0) {//记录当前页数
            bean.setTotalPage(totalNum / bean.getPageSize());
        } else {
            bean.setTotalPage(totalNum / bean.getPageSize() + 1);
        }

        if (bean.getCurrentPage() < 1) {//当前页不能小于1
            bean.setCurrentPage(1);
        }
        if (bean.getCurrentPage() > totalNum) {//当前页不能大于页面总数
            bean.setCurrentPage(totalNum);
        }

        bean.setPre(bean.getCurrentPage() - 1);
        bean.setNext(bean.getCurrentPage() + 1);
        bean.setLast(bean.getTotalPage());

        int fromIndex = (currentPage - 1) * bean.getPageSize();
        int toIndex = Math.min(bean.getTotalNum(), currentPage * bean.getPageSize());
        bean.setList(resultSet.subList(fromIndex, toIndex));//把数据装进集合
        return bean;
    }


}
