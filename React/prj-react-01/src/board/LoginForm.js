import React, {useState, useRef, useEffect} from 'react';
import axios from "axios";

function LoginForm(props){
    // ----------------------------------------------------------------
    // 지역변수 id_pwd 선언하고 {login_id:'', pwd:''} 저장하기
    // 지역변수 setId_pwd 선언하고 id_pwd 변수 안의 데이터를 수정하는 익명함수 저장하기
    // useState 함수를 사용하여 선언된 변수는 갱신 시 함수 컴포넌트 안의 코딩이 재 실행된다.
    // 즉, setId_pwd(~) 가 실행되어 id_pwd 변수 안의 데이터가 갱신되면 
    // 함수 컴포넌트 안의 코딩이 재 실행된다.
    // ----------------------------------------------------------------
    // 개발용. 임시로 아이디 암호값을 넣어주었다. 나중에 완성하면 값 비워주기!  
    const [id_pwd,setId_pwd] = useState( {login_id:'abc', pwd:'123'} );
    // ----------------------------------------------------------------
    // 지역변수 change 선언하고 화살표 함수 저장하기
    // 이 화살표 안의 코딩은 아아디 암호 또는 암호를 입력할때마다 실행된다.  
    // ----------------------------------------------------------------
    const change = (e) => {
        setId_pwd( {...id_pwd, [e.target.name]:e.target.value} );
    }
    // ----------------------------------------------------------------
    // 지역변수 login 선언하고 화살표 함수 저장하기
    // 이 화살표 안의 코딩은 로그인 버튼 클릭 시 실행된다.  
    // ----------------------------------------------------------------
    const login = (e) => {
        // ----------------------------------------------------------------
        // 비동기 방식으로 타 서버에 접속하여
        // JSON 객체로 응답받기
        // ----------------------------------------------------------------
        axios.post(
            // 타 웹서버의 URL 주소 설정
            'http://localhost:8081/naver/loginProc.do'   
            // 타 웹서버로 전송할 사용정객체 설정. 현재 입력한 아이디와 암호가 들어 있음.
            ,id_pwd
        ).then(
            // 타 웹서버가 응답을 성공했을 경우 호출할 화살표 함수 설정하기.  
            // 이때 매개변수로 JSON 객체가 들어 온다.  
            // 타 웹서버는 응답을 JSON 객체로 해준다.  
            // JSON 객체에는 대부분 DB 연동 결과가 들어 있다.  
            responseJson=>{
                // 만약 JSON 객체의 속성변수 responseJson 의 data 에 1이 있으면,
                // 즉, 아이디 암호의 존재 개수가 1이면,   
                // 즉, 아이디 암호가 DB 에 있으면
                if( responseJson.data==1 ){
                    alert("로그인 성공!")
                    props.history.push('/board/BoardList')
                }
                // 만약 JSON 객체의 속성변수 responseJson 의 data 에 1이 아니면,
                // 즉, 아이디 암호의 존재개수가 1이 아니면,  
                // 즉, 아이디 암호가 DB 에 없으면
                else{
                    alert("아이디 또는 암호가 틀립니다. \n재입력 요망!");
                    // id_pwd 변수 안의 사용정객체안의 속성변수에 '' 저장하기 
                    // 즉, 아이디와 암호를 비우기.  
                    setId_pwd( {...id_pwd,...{login_id:'', pwd:''}} );
                    // 위와 아래코드는 똑같은 것이다.
                    // 아이디 암호가 틀렸을때 공백으로 덮어씌우는 것이다.
                    // setId_pwd( {login_id:'aaa', pwd:'123',login_id:'', pwd:''} );
                }
            }
        ).catch(
            // 타 웹서버가 응답을 못했을 경우 호출할 화살표 함수 설정하기
            // 즉, 타 서버와 통신이 실패 했을 때 호출할 화살표 함수.
            // 매개변수로 예외를 관리하는 객체가 들어온다.  
            // error.message 속성변수이다. 예외의 종류가 들어있다.  
            error => {
                alert("서버 통신 실패 : " + error.message);
            }
        )
    }


    return(
        <>
        <center><br/>

            <table border="0" cellPadding="7" cellSpacing="0" bgcolor="lightgray">
                <caption>[로그인]</caption>
            
            <tr>
                <td align="right">[아이디]</td>
                <td>
                    <input 
                        type='text'
                        name='login_id'
                        onChange={change}
                        defaultValue='abc'
                    />
                </td>
            </tr>
            <tr>
                <td align="right">[암 호]</td>
                <td>
                    <input 
                        type='password'
                        name='pwd'
                        onChange={change}
                        maxLength='4'
                        defaultValue='123'
                    />
                </td>
            </tr>
            </table>
            <button onClick={login}>로그인</button>&nbsp;<br/>


            {id_pwd.login_id}<br/>
            {id_pwd.pwd}<br/>

        </center>
        </>
    )

}
export default LoginForm;