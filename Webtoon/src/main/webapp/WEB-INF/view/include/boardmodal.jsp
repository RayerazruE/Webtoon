<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmModalLabel">확인</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                처리가 완료 되었습니다.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>

<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', (event) => {
        const result = '<c:out value="${result}"/>';

        if (result && result !== '') {
            let message = "처리가 완료 되었습니다.";
            if (parseInt(result) > 0) {
                message = `게시글 ${result} 번이 등록되었습니다.`;
            }

            document.querySelector('.modal-body').textContent = message;

            var myModal = new bootstrap.Modal(document.getElementById('confirmModal'));
            myModal.show();
        }
    });
</script>
