package matspoon.k8sbasic.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "memo") // DB 테이블명
@Getter
@Setter
@NoArgsConstructor
public class Memo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // 기본키

    private String title;
    private String memo;
    @Column(name = "create_date", columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP", insertable = false, updatable = false)
    private LocalDateTime createDate;
    @Column(name = "update_date")
    private LocalDateTime updateDate;

    public Memo(String title, String memo) {
        this.title = title;
        this.memo = memo;
    }

    @PreUpdate
    protected void onUpdate() {
        this.updateDate = LocalDateTime.now(); // UPDATE 시마다 updateDate 변경
    }
}
