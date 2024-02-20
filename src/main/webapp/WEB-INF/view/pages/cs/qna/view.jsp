<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>
      <section id="cs">
        <div class="qna">
          <nav>
            <div>
              <p>홈<span>></span>문의하기</p>
            </div>
          </nav>
          <section class="write">
          <%@ include file="/WEB-INF/view/pages/cs/layout/aside.jsp"%>
            <article>
              <form action="${ctxPath}/cs/qna/write.do"  method="post">                
                <div id="smarteditor">
                	<textarea name="editorTxt" id="editorTxt" rows="20" cols="10" placeholder="내용을 입력해주세요." style="width: 500px;"></textarea>
                </div>	
       
                  <a href="${ctxPath}/cs/qna.do?group=qna&type=${type}&cateDeatil=${cateDetail}" class="btnList">취소하기</a>
                  <input type="submit" class="btnSubmit" value="등록하기"/>
                  
              </form>
            </article>
          </section>
        </div>
      </section>
<script src="./js/csScript.js"></script>
<%@ include file="/WEB-INF/view/layout/footer.jsp"%>