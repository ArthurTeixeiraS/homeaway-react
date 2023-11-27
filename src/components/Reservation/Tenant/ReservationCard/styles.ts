import styled from 'styled-components'

export const Card = styled.div`
  display: flex;
  justify-content: space-between;
  height: 100%;
  background: ${(props) => props.theme['background-gray']};
  padding: 2rem;
  margin: 1rem;
  border-radius: 1.5rem;
  .information {
    display: flex;
    justify-content: space-between;
  }
  .infos {
    margin-left: 1rem;
    margin-right: 3rem;
    h3 {
      margin-bottom: 1rem;
    }
    .secondaryInfos {
      margin-top: 0.5rem;
      display: block;
      p {
        font-size: 1.2rem;
      }
      .classification {
        display: flex;
        justify-content: space-around;
      }
    }
    .tenantInfos {
      margin-top: 3rem;
      p {
        font-size: 1.2rem;
      }
    }
  }
  .pricesInfo {
    justify-content: flex-end;
  }
  .buttons {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 2rem;
    #removebtn {
      background-color: ${(props) => props.theme['background-gray']};
      color: ${(props) => props.theme.black};
    }
    button {
      margin: 1rem 0 0 0;
      width: 100%;
      padding: 1rem 3rem;
      border: 0;
      border-radius: 1.5rem;
      background-color: ${(props) => props.theme['blue-primary']};
      color: white;
      font-size: 1.5rem;
      transition: all 0.2s ease-in-out;
      &:hover {
        filter: brightness(90%);
      }
      .remove {
        background-color: #e8eaec;
        color: ${(props) => props.theme.black};
        /* border: 1px solid ${(props) => props.theme.black}; */
      }
    }
    .waiting {
      cursor: progress;
      &:hover {
        filter: brightness(1);
      }
    }
  }
`
