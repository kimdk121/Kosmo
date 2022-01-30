import React, { useState } from "react"

function CheckChic3() {
    const [m_number, setM_number] = useState(0);
    const [w_number, setW_number] = useState(0);

    const setNumber = (m_or_w, number) => {
        if(number<0) {
            
            if (m_or_w=='m' && m_number==0) {
                alert('숫병아리가 0개 미만일 수 없습니다.');return;
            }
            else if (m_or_w=='w' && w_number==0) {
                alert('암병아리가 0개 미만일 수 없습니다.');return;
            }
        }
        
        if (m_or_w=="m"){
            setM_number(m_number+number);
        }
        else if (m_or_w=="w"){
            setW_number(w_number+number);
        }
    }
    return(
        <>
            <center>
                <hr/>
                총 : {m_number+w_number} 마리
                <hr/>
                숫병아리 : <button onClick={()=>{setNumber('m',1)}}>+1</button>
                           <button onClick={()=>{setNumber('m',-1)}}>-1</button>
                           {m_number} 마리
                암병아리 : <button onClick={()=>{setNumber('w',1)}}>+1</button>
                           <button onClick={()=>{setNumber('w',-1)}}>-1</button>
                           {w_number} 마리
            </center>
        </>
    )

}

// ----------------------------------------------------------------
// 현재 이 파일 안에서 기본적으로 수출할 컴포넌트 지정하기
// ----------------------------------------------------------------
export default CheckChic3;