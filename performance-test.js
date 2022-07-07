import http from 'k6/http';
import { sleep } from 'k6';
export const options = {
  vus: 20,
  duration: '30s',	
  ext: {
    loadimpact: {
      projectID: 3592705,
      // Test runs with the same name groups test runs together
      name: "sqd-fe"
    }
  }
};
const url ='http://youtube.com'
export default function () {
  http.get(url);
}
