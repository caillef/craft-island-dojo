#[dojo::contract]
mod mock_token {
    use craft_island::models::{MockToken};
    use starknet::{ContractAddress, get_caller_address};

    fn dojo_init(world: @IWorldDispatcher) {
        let account: ContractAddress = get_caller_address();

        set!(world, MockToken { account: account, amount: 1000 });
    }
}
