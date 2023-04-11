import superagent from "superagent";
import Cookies from "js-cookie";
import { useState } from "react";
async function refresh() {
  const refreshToken = Cookies.get("refreshToken");
  if (!refreshToken) {
    console.error("No refresh token found in cookies");
    return;
  }

  try {
    const res = await superagent
      .post("https://api.sampurna-group.com/v2/users/refresh")
      .set("Authorization", `Bearer ${refreshToken}`)
      .withCredentials();

    // Save updated access token to cookies
    const accessToken = res.body.accessToken;
    Cookies.set("accessToken", accessToken);

    console.log("Token refreshed successfully!");
  } catch (err) {
    console.error(err);
  }
}

export default refresh;
