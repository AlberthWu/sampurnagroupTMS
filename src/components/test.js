import { useCookies } from "react-cookie";
import { useHookstate } from "@hookstate/core";
import axios from "axios";

const Login = () => {
  const [cookies, setCookie] = useCookies(["token"]);

  const tokenState = useHookstate(cookies.token);

  const handleLogin = async (email, password) => {
    try {
      const response = await axios.post(
        "https://api.sampurna-group.com/v2/users/login",
        { email, password },
        { withCredentials: true }
      );

      const setCookieHeader = response.headers["set-cookie"][0];
      const cookieData = setCookieHeader.split(";")[0];
      const [_, tokenValue] = cookieData.split("=");

      setCookie("token", tokenValue);

      tokenState.set(tokenValue);
    } catch (error) {
      console.log(error);
    }
  };

  return (
    <div>
      <form onSubmit={handleLogin}>
        <input type="text" placeholder="email" />
        <input type="password" placeholder="Password" />
        <button type="submit">Login</button>
      </form>
    </div>
  );
};

export default Login;
