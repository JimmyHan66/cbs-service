package com.ccfc.cbs.dao;

import com.ccfc.cbs.utils.Lists;
import org.hibernate.query.internal.NativeQueryImpl;
import org.hibernate.transform.Transformers;
import org.nutz.mapl.Mapl;
import org.springframework.data.jpa.repository.support.JpaEntityInformation;
import org.springframework.data.jpa.repository.support.SimpleJpaRepository;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.Optional;

/**
 * 基础dao实现类
 *
 * @author ：enilu
 * @date ：Created in 2019/6/29 12:53
 */
public class BaseRepositoryImpl<T, ID extends Serializable>
        extends SimpleJpaRepository<T, ID>
        implements BaseRepository<T, ID> {
    private final EntityManager entityManager;
    private Class<T> klass;


    BaseRepositoryImpl(JpaEntityInformation<T, ID> entityInformation,
                       EntityManager entityManager) {
        super(entityInformation, entityManager);
        this.entityManager = entityManager;
        this.klass = (Class<T>) entityInformation.getJavaType();
    }


    @Override
    public List<T> queryBySql(String sql) {
        List list = entityManager.createNativeQuery(sql, klass).getResultList();
        return list ;
    }

    @Override
    public List<?> queryObjBySql(String sql, Class<?> klass) {
         List<Map> list = queryMapBySql(sql);
         if(list.isEmpty()){
             return Lists.newArrayList();
         }
         List result = Lists.newArrayList();
        for(Map map:list){
            try {
                Object bean = Mapl.maplistToObj(map, klass);
                result.add(bean);
            } catch (Exception e) {
            }
        }
        return result ;

    }

    @Override
    public List<Map> queryMapBySql(String sql) {
        Query query = entityManager.createNativeQuery(sql);
        query.unwrap(NativeQueryImpl.class)
                .setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List list = query.getResultList();
        return list;
    }

    @Override
    public Map getMapBySql(String sql) {
        List<Map> list = queryMapBySql(sql);
        if (list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    @Override
    public T getOne(ID id) {
        Optional<T> optional = findById(id);
        if(optional.isPresent()){
            return optional.get();
        }
        return null;
    }

    @Override
    public T get(String sql) {
        List<T> list = entityManager.createNativeQuery(sql, klass).getResultList();
        return list.get(0);
    }

    @Override
    public int execute(String sql) {
        return entityManager.createNativeQuery(sql).executeUpdate();
    }

    @Override
    public Class<T> getDataClass() {
        return klass;
    }

    @Override
    public List<T> query(String sql) {
        return entityManager.createNativeQuery(sql, klass).getResultList();
    }
}
