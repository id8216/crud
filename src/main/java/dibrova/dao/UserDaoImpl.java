package dibrova.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import dibrova.model.User;

import java.util.ArrayList;
import java.util.List;

@Repository
public class UserDaoImpl implements UserDao {

    private static final int PAGES_COUNT = 7;
    private SessionFactory sessionFactory;


    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(user);
    }

    @Override
    public void updateUser(User user) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(user);
    }

    @Override
    public void removeUser(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, new Integer(id));

        if (user != null){
            session.delete(user);
        }
    }

    @Override
    public User getUserById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        User user = (User)session.get(User.class, new Integer(id));
        return user;
    }

    @Override
    public List<User> getUserByName(String name) {
        Session session = this.sessionFactory.getCurrentSession();
        List<User> result =  session.createQuery(String.format("from User WHERE name='%s'", name)).list();
        return result;
    }

    @Override
    public List<User> getUserByAdmin() {
        Session session = this.sessionFactory.getCurrentSession();
        List<User> result =  session.createQuery("from User WHERE isAdmin=true").list();
        return result;
    }

    @Override
    @SuppressWarnings("uncheked")
    public List<List<User>> listUsers() {
        Session session = this.sessionFactory.getCurrentSession();
        List<List<User>> pages = new ArrayList<>();
        for (int i = 0; ; i += PAGES_COUNT){
            List<User> page = session.createQuery("from User").setFirstResult(i).setMaxResults(PAGES_COUNT).list();
            if (page.isEmpty()){
                break;
            }
            pages.add(page);
        }
        return pages;
    }
}
