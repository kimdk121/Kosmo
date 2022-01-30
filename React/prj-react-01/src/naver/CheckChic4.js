import React, { Component } from "react"

class CheckChic4 extends Component {
    state = {
        m_number : 0
        ,w_number : 0
    }

    setNumber = (m_or_w, number) => {
        const m_number = this.state.m_number;
        const w_number = this.state.w_number;

        if(number<0) {
            
            if (m_or_w=='m' && m_number==0) {
                alert('숫병아리가 0개 미만일 수 없습니다.');return;
            }
            else if (m_or_w=='w' && w_number==0) {
                alert('암병아리가 0개 미만일 수 없습니다.');return;
            }
        }
        
        if (m_or_w=="m"){
            this.setState( {m_number:m_number+number} );
        }
        else if (m_or_w=="w"){
            this.setState( {w_number:w_number+number} );
        }
    }
    render() {
        const m_number = this.state.m_number;
        const w_number = this.state.w_number;
        return(
            <>
                <center>
                    <hr/>
                    총 : {m_number+w_number} 마리
                    <hr/>
                    숫병아리 : <button onClick={()=>{this.setNumber('m',1)}}>+1</button>
                            <button onClick={()=>{this.setNumber('m',-1)}}>-1</button>
                            {m_number} 마리
                    암병아리 : <button onClick={()=>{this.setNumber('w',1)}}>+1</button>
                            <button onClick={()=>{this.setNumber('w',-1)}}>-1</button>
                            {w_number} 마리
                </center>
            </>
        )
    }
}

// ----------------------------------------------------------------
// 현재 이 파일 안에서 기본적으로 수출할 컴포넌트 지정하기
// ----------------------------------------------------------------
export default CheckChic4;