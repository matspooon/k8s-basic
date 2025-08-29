package matspoon.k8sbasic.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import matspoon.k8sbasic.entity.Memo;

@Repository
public interface MemoRepository extends JpaRepository<Memo, Long> {
    // JpaRepository는 기본 CRUD 메서드를 이미 제공함
    // save(), findById(), findAll(), deleteById() 등
}
