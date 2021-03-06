import React, { Component } from "react";
import './validation.css'

class CheckLogin extends Component {
    // ----------------------------------------------------------------
    // 리액트가 제공하는 state 속성변수 선언하고 [사용자정의 객체]를 저장하기
    // ----------------------------------------------------------------
        // ----------------------------------------------------------------
        // 클래스 컴포넌트 안에서 리액트가 저공하는 state 속성변수 특징
        // ----------------------------------------------------------------
            // state 속성변수의 갱신은 리액트가 제공하는 setState 메소드 호출로만 가능하다.
            // setState 메소드 호출로 state 속성변수 안의 값이 갱신되면 render 메소드가 재호출된다.
            // state 속성변수 호출할 경우 this.을 붙인다.
    state = {
        pwd: ''
        ,id: ''
        ,clicked:false
        ,validated:false
    };
    // ----------------------------------------------------------------
    // 속성변수 handleChange 선언하고 화살표 함수 (=익명함수) 저장하기
    // ----------------------------------------------------------------
    handleChange = (e) => {

        if (e.target.name==="pwd") {
            // ----------------------------------------------------------------
            // setState 메소드 호출하여 state 변수 안의 데이터를 갱신한다.
            // 즉 state 변수안의 사용자정의 객체 안의 속성변수 password 안의 값이 바뀌는 것이다.
            // setState 메소드 호출 시 this.를 붙여야한다.
            // setState 메소드 호출하면 render 메소드가 재 호출되고 리턴되는
            // JSX 의 실행결과가 웹 브라우저로 출력된다.
            // ----------------------------------------------------------------
            this.setState(
                {password: e.target.value}
            );
        }
        // ----------------------------------------------------------------
        // e.target.value => 이벤트가 발생한 놈의 value 속성값을 의미한다.
        //                   즉 이벤트가 발생한 입력의 입력/선택값을 말한다.
        // <주의> 매개변수 e 에는 이벤트를 관리하는 객체가 들어온다.
        //        target 은 이벤트 관리 객체의 속성변수로 이벤트가 발생한 입력양식을 관리하는 객체가 저장되어 있다.
        //        value 는 입력양식을 관리하는 객체의 속성변수로 입력 또는 선택한 값이 저장되어 있다.
        // ----------------------------------------------------------------
        if (e.target.name==="id") {
            this.setState(
                {password: e.target.value}
            );
        }
    };
    // ----------------------------------------------------------------
    // 속성변수 handleButtonClick 선언하고 화살표 함수 (=익명함수) 저장하기
    // ----------------------------------------------------------------
    handleButtonClick = () => {
        // ----------------------------------------------------------------
        // setState 메소드 호출하여 state 변수를 갱신한다.
        // setState 메소드 호출하여 state 변수를 갱신한다.
        // setState 메소드 호출 시 this. 를 붙여야 한다.
        // setState 메소드 호출하면 render 메소드가 재 호출되고 리턴되는
        // JSX의 실행결과가 웹 브라우저로 출력된다.
        // ----------------------------------------------------------------
        this.setState (
            {
                clicked: true
                ,validated: this.state.pwd === '0000'
            }
        );
    };
    // ----------------------------------------------------------------
    // render 메소드 선언하기
    // render 메소드는 [클래스 컴포넌트]를 처음 호출할 때, setState 메소드 호출할 때 재호출된다.
    // ----------------------------------------------------------------
    render() {
        return (
            <>
                <center>
                    {/* ---------------------------------------------------------------- */}
                    {/* 암호 입력 양식 태그 선언하기 */}
                    {/* ---------------------------------------------------------------- */}
                    <table>
                        <tr>
                            <th> 아이디 : </th>
                            <th> <input type="text" value={this.state.id} onChange={this.handleChange} className={this.state.clicked?(this.state.validated?'success':'failure'):''}/> </th>
                        </tr>
                        <tr>
                            <th> 암 호 : </th>
                            <th> <input type="password" value={this.state.password} onChange={this.handleChange} className={this.state.clicked?(this.state.validated?'success':'failure'):''}/>&nbsp; </th>
                        </tr>
                    </table>
                    

                    <button onClick={this.handleButtonClick}>검증하기</button>
                </center>
            </>
        );
    }
}
export default CheckLogin;