50btc_info
================

Script for retrieving info about your [50btc.com](https://50btc.com) mining pool.

## Usage instructions

1- Get your API key [here](https://50btc.com/account/api)

2- Install required gems
> bundle install

3- Add this directory to your path (in ~/.bashrc or ~/.zshrc)
> PATH=$PATH:/path/to/50btc_info

4- Add an alias to call script (also in ~/.bashrc or ~/.zshrc)
> alias btc_info='pool_info.rb YOUR_50BTC_API_KEY_HERE | python -mjson.tool'

5- You should be able to type 'btc_info' in your console and see info about your machine pool

Ex:
```
{
    "user": {
        "active_workers": 1,
        "confirmed_rewards": 321.00629856,
        "hash_rate": "7387.09",
        "payouts": 232
    },
    "workers": {
        "1": {
            "alive": true,
            "blocks_found": 1,
            "checkpoint_invalid": 0,
            "checkpoint_shares": 0,
            "checkpoint_stales": 0,
            "hash_rate": "7432.16",
            "invalid": 0,
            "last_share": "2013-05-24 17:51:03 -0700 (17 min ago)",
            "shares": 6,
            "stales": 0,
            "total_invalid": 19,
            "total_shares": 22308,
            "total_stales": 4,
            "worker_name": "test@test.com_test"
        }
}
```
