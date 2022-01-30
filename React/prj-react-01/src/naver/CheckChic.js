import React, { Component } from "react";

class CheckChic extends Component {

    state = {
        m_number : 0
        ,w_number : 0
    }

    m_add = () => {
        this.setState({m_number:this.state.m_number+1});
    }
    m_minus = () => {
        this.setState({m_number:this.state.m_number-1});
    }
    w_add = () => {
        this.setState({w_number:this.state.w_number+1});
    }
    w_minus = () => {
        this.setState({w_number:this.state.w_number-1});
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
                    숫병아리 : <button onClick={this.m_add}>+1</button>
                            <button onClick={this.m_minus}>-1</button>
                            {m_number} 마리
                    암병아리 : <button onClick={this.w_add}>+1</button>
                            <button onClick={this.w_minus}>-1</button>
                            {w_number} 마리
                </center>
            </>
        )
    }

}
// ----------------------------------------------------------------
// 현재 이 파일 안에서 기본적으로 수출할 컴포넌트 지정하기
// ----------------------------------------------------------------
export default CheckChic;