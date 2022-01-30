import React, { useState } from "react"

function CheckChic2() {
    const [m_number, setM_number] = useState(0);
    const [w_number, setW_number] = useState(0);

    const m_add = () => {
        setM_number(m_number+1);
    }
    const m_minus = () => {
        setM_number(m_number-1);
    }
    const w_add = () => {
        setW_number(w_number+1);
    }
    const w_minus = () => {
        setW_number(w_number-1);
    }
    /*
    const set = (m_or_w, num) => {
        if (m_or_w=="m"){
            setM_number(m_number+num);
        }
        else if (m_or_w=="w"){
            setW_number(w_number+num);
        }
    }
    */
    return(
        <>
            <center>
                <hr/>
                총 : {m_number+w_number} 마리
                <hr/>
                숫병아리 : <button onClick={m_add}>+1</button>
                           <button onClick={m_minus}>-1</button>
                           {m_number} 마리
                암병아리 : <button onClick={w_add}>+1</button>
                           <button onClick={w_minus}>-1</button>
                           {w_number} 마리
            </center>
        </>
    )

}

// ----------------------------------------------------------------
// 현재 이 파일 안에서 기본적으로 수출할 컴포넌트 지정하기
// ----------------------------------------------------------------
export default CheckChic2;