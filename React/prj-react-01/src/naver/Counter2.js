// ----------------------------------------------------------------
// 프로젝트명 /node_modules/react 안에 default 가 붙어 수출하는 놈을 수입해서
// 현재 파일 안에서 React 란 이름으로 사용한다.
// 프로젝트명 /node_modules/react 안에 default 가 안붙어 수출하는 놈 Component 를 수입해서
// 현재 파일 안에서 Component 란 이름으로 사용할 것이다.
// ----------------------------------------------------------------
// <참고> 아래 수입 코드는 클래스 컴포넌트가 선언되는 js 파일안에서는 필수로 수입되는 것들이다.
import React, {useState } from "react";

// ----------------------------------------------------------------
// 리액트의 단위 프로그램중 하나인 [함수 컴포넌트] 선언하기
// ----------------------------------------------------------------
function Counter2() {
    // ----------------------------------------------------------------
    // 지역변수 default_number 선언하고 0 저장하기
    // ----------------------------------------------------------------
    const default_number = 0;

    // ----------------------------------------------------------------
    // 지역변수 number, setNumber 선언하고
    // 리액트가 제공하는 내장함수 useState(default_number) 를 호출하여
    // 지역변수 number에 default_number 변수안의 데이터를 저장하고
    // 지역변수 setNumber에 number 변수안의 데이터를 수정하는 익명함수 저장하기
    // ----------------------------------------------------------------
    // 이제부터 setNumber 변수안의 익명함수를 호출하여
    // number 변수안의 데이터가 갱신되면 Counter2 함수가 재호출된다.
    // ----------------------------------------------------------------
    // setNumber 변수안의 익명함수를 호출하는 방법은 setNumber(number 변수안에 저장될 데이터)이다.
    const [number, setNumber] = useState(default_number);

    // ----------------------------------------------------------------
    // 지역변수 add, minus, init 선언하고 화살표 함수 저장하기
    // ----------------------------------------------------------------
    const add = () => {
        // 지역변수 number 안의 데이터를 1 업데이트하기
        // 이때 setNumber(~) 호출로 업데이트 한다.
        // setNumber(~) 호출이 실행되면 함수 컴포넌트는 재호출된다.
        setNumber (number+1);
    };

    const minus = () => { setNumber (number-1) };
    const init = () => { setNumber (default_number) };

    return(

        <>
            <center>

                시작값 : {default_number} <br/>

                현재값 : {number} <br/>

                <button onClick={add}> +1 </button> &nbsp;&nbsp;
                
                <button onClick={minus}> -1 </button> &nbsp;&nbsp;
                
                <button onClick={init}> 초기값으로 </button>

            </center>
        </>
    )

}

export default Counter2;