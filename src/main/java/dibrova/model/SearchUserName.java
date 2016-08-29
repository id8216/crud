package dibrova.model;

import org.springframework.stereotype.Component;

@Component
public class SearchUserName {
    private String userName;

    public String getSearchName() {
        return userName;
    }

    public void setSearchName(String userName) {
        this.userName = userName;
    }
}
