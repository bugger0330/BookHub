  $(document).ready(function() {
            // 입력창에 숫자 입력 시 #,### 형식으로 변경
            $('.price, .point').on('input', function() {
                var num = $(this).val().replace(/\D/g, "").replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                $(this).val(num);
            });

            // 폼 제출 시 쉼표(,) 제거
            $('#productUploadForm').submit(function() {
                $('.price, .point').each(function() {
                    var num = $(this).val().replace(/\D/g, "");
                    $(this).val(num);
                });
            });
        });